<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Response;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Component\HttpFoundation\Request;
use App\Entity\MoisAnnee;
use App\Entity\Bail;


class PaiementController extends AbstractController
{
    #[Route('/paiement', name: 'app_paiement')]
    public function index(): Response
    {
        return $this->render('paiement/index.html.twig', [
            'controller_name' => 'PaiementController',
        ]);
    }


    // Fonction pour récupérer la liste des loyers pour un mois donné à partir de l'id de la table MoisAnnee

    public function listerLoyersMois(ManagerRegistry $doctrine, int $id){

        $mois = $doctrine->getRepository(MoisAnnee::class)->find($id);
       // var_dump($mois);

        return $this->render('paiement/listerMois.html.twig', [
            'mois' => $mois,]);	
    }



      // Permet de récupérer la liste des paiements en fonction bail et donc des locataires
    public function listerPaiementsLoc(ManagerRegistry $doctrine, int $id){

        $bail = $doctrine->getRepository(Bail::class)->find($id);


        if (!$bail) 
            throw $this->createNotFoundException(
            'Aucun paiement trouvé pour le bail n°'.$id
            );
        
        
        return $this->render('paiement/listerByLoc.html.twig', [
            'bail' => $bail,]);
    
    }


}