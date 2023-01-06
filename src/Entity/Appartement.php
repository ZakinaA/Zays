<?php

namespace App\Entity;

use App\Repository\AppartementRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: AppartementRepository::class)]
class Appartement
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(nullable: true)]
    private ?int $porte = null;

    #[ORM\Column(nullable: true)]
    private ?float $surface = null;

    #[ORM\Column(nullable: true)]
    private ?float $surfaceSol = null;

    #[ORM\Column(length: 50, nullable: true)]
    private ?string $situation = null;

    #[ORM\Column(length: 255, nullable: true)]
    private ?string $equipements = null;

    #[ORM\Column(length: 255, nullable: true)]
    private ?string $travaux = null;

    #[ORM\Column(length: 255, nullable: true)]
    private ?string $ventilation = null;

    #[ORM\OneToMany(mappedBy: 'appartement', targetEntity: Bail::class)]
    private Collection $bails;

    #[ORM\ManyToOne(inversedBy: 'appartements')]
    private ?Immeuble $immeuble = null;

    public function __construct()
    {
        $this->bails = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getPorte(): ?int
    {
        return $this->porte;
    }

    public function setPorte(?int $porte): self
    {
        $this->porte = $porte;

        return $this;
    }

    public function getSurface(): ?float
    {
        return $this->surface;
    }

    public function setSurface(?float $surface): self
    {
        $this->surface = $surface;

        return $this;
    }

    public function getSurfaceSol(): ?float
    {
        return $this->surfaceSol;
    }

    public function setSurfaceSol(?float $surfaceSol): self
    {
        $this->surfaceSol = $surfaceSol;

        return $this;
    }

    public function getSituation(): ?string
    {
        return $this->situation;
    }

    public function setSituation(?string $situation): self
    {
        $this->situation = $situation;

        return $this;
    }

    public function getEquipements(): ?string
    {
        return $this->equipements;
    }

    public function setEquipements(?string $equipements): self
    {
        $this->equipements = $equipements;

        return $this;
    }

    public function getTravaux(): ?string
    {
        return $this->travaux;
    }

    public function setTravaux(?string $travaux): self
    {
        $this->travaux = $travaux;

        return $this;
    }

    public function getVentilation(): ?string
    {
        return $this->ventilation;
    }

    public function setVentilation(?string $ventilation): self
    {
        $this->ventilation = $ventilation;

        return $this;
    }

    /**
     * @return Collection<int, Bail>
     */
    public function getBails(): Collection
    {
        return $this->bails;
    }

    public function addBail(Bail $bail): self
    {
        if (!$this->bails->contains($bail)) {
            $this->bails->add($bail);
            $bail->setAppartement($this);
        }

        return $this;
    }

    public function removeBail(Bail $bail): self
    {
        if ($this->bails->removeElement($bail)) {
            // set the owning side to null (unless already changed)
            if ($bail->getAppartement() === $this) {
                $bail->setAppartement(null);
            }
        }

        return $this;
    }

    public function getImmeuble(): ?Immeuble
    {
        return $this->immeuble;
    }

    public function setImmeuble(?Immeuble $immeuble): self
    {
        $this->immeuble = $immeuble;

        return $this;
    }
}
