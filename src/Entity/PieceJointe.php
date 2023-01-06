<?php

namespace App\Entity;

use App\Repository\PieceJointeRepository;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: PieceJointeRepository::class)]
class PieceJointe
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 100, nullable: true)]
    private ?string $libelle = null;

    #[ORM\Column(length: 100, nullable: true)]
    private ?string $nomFichier = null;

    #[ORM\ManyToOne(inversedBy: 'pieceJointes')]
    private ?TypePieceJointe $typePieceJointe = null;

    #[ORM\ManyToOne(inversedBy: 'pieceJointes')]
    private ?Locataire $locataire = null;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getLibelle(): ?string
    {
        return $this->libelle;
    }

    public function setLibelle(?string $libelle): self
    {
        $this->libelle = $libelle;

        return $this;
    }

    public function getNomFichier(): ?string
    {
        return $this->nomFichier;
    }

    public function setNomFichier(?string $nomFichier): self
    {
        $this->nomFichier = $nomFichier;

        return $this;
    }

    public function getTypePieceJointe(): ?TypePieceJointe
    {
        return $this->typePieceJointe;
    }

    public function setTypePieceJointe(?TypePieceJointe $typePieceJointe): self
    {
        $this->typePieceJointe = $typePieceJointe;

        return $this;
    }

    public function getLocataire(): ?Locataire
    {
        return $this->locataire;
    }

    public function setLocataire(?Locataire $locataire): self
    {
        $this->locataire = $locataire;

        return $this;
    }
}
