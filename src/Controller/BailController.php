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



}
