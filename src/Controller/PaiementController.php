<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

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

        return $this->render('paiement/listerMois.html.twig', [
            'mois' => $mois,]);	
    }







}
