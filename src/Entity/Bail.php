<?php

namespace App\Entity;

use App\Repository\BailRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: BailRepository::class)]
class Bail
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(type: Types::DATE_MUTABLE, nullable: true)]
    private ?\DateTimeInterface $dateDebut = null;

    #[ORM\Column(nullable: true)]
    private ?float $montantHC = null;

    #[ORM\Column(nullable: true)]
    private ?float $montantCharges = null;

    #[ORM\Column(nullable: true)]
    private ?float $montantCaution = null;

    #[ORM\Column(length: 50, nullable: true)]
    private ?string $nomCaution1 = null;

    #[ORM\Column(length: 50, nullable: true)]
    private ?string $nomCaution2 = null;

    #[ORM\Column(type: Types::DATE_MUTABLE, nullable: true)]
    private ?\DateTimeInterface $dateFin = null;

    #[ORM\Column(length: 50, nullable: true)]
    private ?string $dureeBail = null;

    #[ORM\Column(length: 50, nullable: true)]
    private ?string $bailSigne = null;

    #[ORM\Column(length: 150, nullable: true)]
    private ?string $etatLieuEntree = null;

    #[ORM\Column(length: 150, nullable: true)]
    private ?string $etatLieuSortie = null;

    #[ORM\Column(length: 50, nullable: true)]
    private ?string $attestationAssurance = null;

    #[ORM\Column(nullable: true)]
    private ?float $montantPremEcheance = null;

    #[ORM\Column(nullable: true)]
    private ?float $montantDerEcheance = null;

    #[ORM\Column(nullable: true)]
    private ?int $archive = null;

    #[ORM\ManyToOne(inversedBy: 'bails')]
    private ?Appartement $appartement = null;

    #[ORM\ManyToOne(inversedBy: 'bails')]
    private ?Associe $associe = null;

    #[ORM\OneToMany(mappedBy: 'bail', targetEntity: Paiement::class)]
    private Collection $paiements;

    #[ORM\ManyToMany(targetEntity: Locataire::class, inversedBy: 'bails')]
    private Collection $locataires;

    public function __construct()
    {
        $this->paiements = new ArrayCollection();
        $this->locataires = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getDateDebut(): ?\DateTimeInterface
    {
        return $this->dateDebut;
    }

    public function setDateDebut(?\DateTimeInterface $dateDebut): self
    {
        $this->dateDebut = $dateDebut;

        return $this;
    }

    public function getMontantHC(): ?float
    {
        return $this->montantHC;
    }

    public function setMontantHC(?float $montantHC): self
    {
        $this->montantHC = $montantHC;

        return $this;
    }

    public function getMontantCharges(): ?float
    {
        return $this->montantCharges;
    }

    public function setMontantCharges(?float $montantCharges): self
    {
        $this->montantCharges = $montantCharges;

        return $this;
    }

    public function getMontantCaution(): ?float
    {
        return $this->montantCaution;
    }

    public function setMontantCaution(?float $montantCaution): self
    {
        $this->montantCaution = $montantCaution;

        return $this;
    }

    public function getNomCaution1(): ?string
    {
        return $this->nomCaution1;
    }

    public function setNomCaution1(?string $nomCaution1): self
    {
        $this->nomCaution1 = $nomCaution1;

        return $this;
    }

    public function getNomCaution2(): ?string
    {
        return $this->nomCaution2;
    }

    public function setNomCaution2(?string $nomCaution2): self
    {
        $this->nomCaution2 = $nomCaution2;

        return $this;
    }

    public function getDateFin(): ?\DateTimeInterface
    {
        return $this->dateFin;
    }

    public function setDateFin(?\DateTimeInterface $dateFin): self
    {
        $this->dateFin = $dateFin;

        return $this;
    }

    public function getDureeBail(): ?string
    {
        return $this->dureeBail;
    }

    public function setDureeBail(?string $dureeBail): self
    {
        $this->dureeBail = $dureeBail;

        return $this;
    }

    public function getBailSigne(): ?string
    {
        return $this->bailSigne;
    }

    public function setBailSigne(?string $bailSigne): self
    {
        $this->bailSigne = $bailSigne;

        return $this;
    }

    public function getEtatLieuEntree(): ?string
    {
        return $this->etatLieuEntree;
    }

    public function setEtatLieuEntree(?string $etatLieuEntree): self
    {
        $this->etatLieuEntree = $etatLieuEntree;

        return $this;
    }

    public function getEtatLieuSortie(): ?string
    {
        return $this->etatLieuSortie;
    }

    public function setEtatLieuSortie(?string $etatLieuSortie): self
    {
        $this->etatLieuSortie = $etatLieuSortie;

        return $this;
    }

    public function getAttestationAssurance(): ?string
    {
        return $this->attestationAssurance;
    }

    public function setAttestationAssurance(?string $attestationAssurance): self
    {
        $this->attestationAssurance = $attestationAssurance;

        return $this;
    }

    public function getMontantPremEcheance(): ?float
    {
        return $this->montantPremEcheance;
    }

    public function setMontantPremEcheance(?float $montantPremEcheance): self
    {
        $this->montantPremEcheance = $montantPremEcheance;

        return $this;
    }

    public function getMontantDerEcheance(): ?float
    {
        return $this->montantDerEcheance;
    }

    public function setMontantDerEcheance(?float $montantDerEcheance): self
    {
        $this->montantDerEcheance = $montantDerEcheance;

        return $this;
    }

    public function getArchive(): ?int
    {
        return $this->archive;
    }

    public function setArchive(?int $archive): self
    {
        $this->archive = $archive;

        return $this;
    }

    public function getAppartement(): ?Appartement
    {
        return $this->appartement;
    }

    public function setAppartement(?Appartement $appartement): self
    {
        $this->appartement = $appartement;

        return $this;
    }

    public function getAssocie(): ?Associe
    {
        return $this->associe;
    }

    public function setAssocie(?Associe $associe): self
    {
        $this->associe = $associe;

        return $this;
    }

    /**
     * @return Collection<int, Paiement>
     */
    public function getPaiements(): Collection
    {
        return $this->paiements;
    }

    public function addPaiement(Paiement $paiement): self
    {
        if (!$this->paiements->contains($paiement)) {
            $this->paiements->add($paiement);
            $paiement->setBail($this);
        }

        return $this;
    }

    public function removePaiement(Paiement $paiement): self
    {
        if ($this->paiements->removeElement($paiement)) {
            // set the owning side to null (unless already changed)
            if ($paiement->getBail() === $this) {
                $paiement->setBail(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection<int, Locataire>
     */
    public function getLocataires(): Collection
    {
        return $this->locataires;
    }

    public function addLocataire(Locataire $locataire): self
    {
        if (!$this->locataires->contains($locataire)) {
            $this->locataires->add($locataire);
        }

        return $this;
    }

    public function removeLocataire(Locataire $locataire): self
    {
        $this->locataires->removeElement($locataire);

        return $this;
    }
}
