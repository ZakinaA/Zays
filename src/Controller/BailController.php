<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class BailController extends AbstractController
{
    #[Route('/bail', name: 'app_bail')]
    public function index(): Response
    {
        return $this->render('bail/index.html.twig', [
            'controller_name' => 'BailController',
        ]);
    }


    // Fonction permettant de retourner la liste des appartements

    public function listerAppartement(ManagerRegistry $doctrine){

        $repository = $doctrine->getRepository(Bail::class);
    
    $appartements= $repository->findBy(['' => 0]);
    return $this->render('bail/lister.html.twig', [
    'pApparts' => $appartements,]);	
    
    }


}
