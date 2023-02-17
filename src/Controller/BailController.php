<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Dompdf\Dompdf;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Response;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Component\HttpFoundation\Request;
use App\Entity\Appartement;
use App\Entity\Bail;
use App\Entity\Locataire;
use App\Form\BailType;

class BailController extends AbstractController
{
    #[Route('/bail', name: 'app_bail')]
    public function index(): Response
    {
        return $this->render('bail/index.html.twig', [
            'controller_name' => 'BailController',
        ]);
    }


    // Retourner la liste des baux avec un bail non archivé

    public function listerBaux(ManagerRegistry $doctrine){

        $baux = $doctrine->getRepository(Bail::class)->findByArchive(["archive" => null]);
    
    return $this->render('bail/lister.html.twig', [
    'baux' => $baux,]);	
    
    }


    // Ajout d'un bail à partir d'un formulaire

    public function ajouterBail(Request $request, ManagerRegistry $doctrine){
        $bail = new Bail();

        $locataire = new Locataire();
        $locataire->setNom(null);
        $locataire->setPrenom(null);
        $locataire->setDateNaissance(null);
        $locataire->setLieuNaissance(null);
        $bail->getLocataires()->add($locataire);
        

        $form = $this->createForm(BailType::class, $bail);
        $form->handleRequest($request);
         
        if ($form->isSubmitted() && $form->isValid()) {
         
            $bail = $form->getData();
         
            $entityManager = $doctrine->getManager();
            $entityManager->persist($bail);
            $entityManager->flush();
         
            return $this->render('bail/consulter.html.twig', ['bail' => $bail,]);
        }
        else{
            return $this->render('bail/ajouter.html.twig', array('form' => $form->createView(),));
        }
        
    }



    // Retourner les informations d'un bail pour le consulter

    public function consulterBail(ManagerRegistry $doctrine, int $id){

        $bail = $doctrine->getRepository(Bail::class)->find($id);

        if (!$bail) {
            throw $this->createNotFoundException(
            'Aucun bail trouvé'
            );
        }

        return $this->render('bail/consulter.html.twig', [
            'bail' => $bail,]);

}



// Générer le PDF pour un bail donné
    public function genererBailPDF(ManagerRegistry $doctrine, int $id){

        $bail = $doctrine->getRepository(Bail::class)->find($id);

        if (!$bail) {
            throw $this->createNotFoundException(
            'Aucun bail trouvé'
            );
        }

        // Instanciation de la librairie DOMPDF
        $dompdf = new Dompdf();

        // Contenu HTML
        $html = $this->renderView('bail/pdf.html.twig', [
            'bail' => $bail
        ]);

        // Chargement du contenu HTML
        $dompdf->loadHtml($html);

        // Configuration des options
        $dompdf->setPaper('A4', 'portrait');

        // Rendu du PDF
        $dompdf->render();

        // Envoi du PDF dans la réponse
        $dompdf->stream("bail_".$bail->getId().".pdf", [
            "Attachment" => false
        ]);
    }

}