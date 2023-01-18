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
