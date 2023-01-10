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


    // Retourner la liste des appartements avec un bail non archivé

    public function listerAppartements(ManagerRegistry $doctrine){

        $appartements = $doctrine->getRepository(Bail::class)->findByArchive(["archive" => null]);
    
    return $this->render('bail/lister.html.twig', [
    'pApparts' => $appartements,]);	
    
    }


}
