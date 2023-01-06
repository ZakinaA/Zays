<?php

namespace App\Entity;

use App\Repository\MoisAnneeRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: MoisAnneeRepository::class)]
class MoisAnnee
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(type: Types::DATE_MUTABLE, nullable: true)]
    private ?\DateTimeInterface $dateMoisAnnee = null;

    #[ORM\OneToMany(mappedBy: 'moisAnnee', targetEntity: Paiement::class)]
    private Collection $paiements;

    public function __construct()
    {
        $this->paiements = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getDateMoisAnnee(): ?\DateTimeInterface
    {
        return $this->dateMoisAnnee;
    }

    public function setDateMoisAnnee(?\DateTimeInterface $dateMoisAnnee): self
    {
        $this->dateMoisAnnee = $dateMoisAnnee;

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
            $paiement->setMoisAnnee($this);
        }

        return $this;
    }

    public function removePaiement(Paiement $paiement): self
    {
        if ($this->paiements->removeElement($paiement)) {
            // set the owning side to null (unless already changed)
            if ($paiement->getMoisAnnee() === $this) {
                $paiement->setMoisAnnee(null);
            }
        }

        return $this;
    }
}
