<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Response;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Component\HttpFoundation\Request;
use App\Entity\Appartement;
use App\Entity\Bail;

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


}
