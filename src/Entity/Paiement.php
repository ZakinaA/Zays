<?php

namespace App\Entity;

use App\Repository\PaiementRepository;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: PaiementRepository::class)]
class Paiement
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(type: Types::DATE_MUTABLE, nullable: true)]
    private ?\DateTimeInterface $dateP = null;

    #[ORM\Column(nullable: true)]
    private ?float $montant = null;

    #[ORM\Column(length: 100, nullable: true)]
    private ?string $source = null;

    #[ORM\ManyToOne(inversedBy: 'paiements')]
    private ?Bail $bail = null;

    #[ORM\ManyToOne(inversedBy: 'paiements')]
    private ?MoisAnnee $moisAnnee = null;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getDateP(): ?\DateTimeInterface
    {
        return $this->dateP;
    }

    public function setDateP(?\DateTimeInterface $dateP): self
    {
        $this->dateP = $dateP;

        return $this;
    }

    public function getMontant(): ?float
    {
        return $this->montant;
    }

    public function setMontant(?float $montant): self
    {
        $this->montant = $montant;

        return $this;
    }

    public function getSource(): ?string
    {
        return $this->source;
    }

    public function setSource(?string $source): self
    {
        $this->source = $source;

        return $this;
    }

    public function getBail(): ?Bail
    {
        return $this->bail;
    }

    public function setBail(?Bail $bail): self
    {
        $this->bail = $bail;

        return $this;
    }

    public function getMoisAnnee(): ?MoisAnnee
    {
        return $this->moisAnnee;
    }

    public function setMoisAnnee(?MoisAnnee $moisAnnee): self
    {
        $this->moisAnnee = $moisAnnee;

        return $this;
    }
}
