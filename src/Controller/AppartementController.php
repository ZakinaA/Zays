<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Entity\Appartement;

class AppartementController extends AbstractController
{
    #[Route('/appartement', name: 'app_appartement')]
    public function index(): Response
    {
        return $this->render('appartement/index.html.twig', [
            'controller_name' => 'AppartementController',
        ]);
    }


    // Fonction permettant de retourner la liste des appartements

    public function listerAppartement(ManagerRegistry $doctrine){

        $repository = $doctrine->getRepository(Appartement::class);
    
    $appartements= $repository->findAll();
    return $this->render('appartement/lister.html.twig', [
    'pApparts' => $appartements,]);	
    
    }




}
