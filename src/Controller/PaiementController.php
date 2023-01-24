<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Response;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Component\HttpFoundation\Request;
use App\Entity\MoisAnnee;

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







}
