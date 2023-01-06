<?php

namespace App\Entity;

use App\Repository\SocieteRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: SocieteRepository::class)]
class Societe
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 50, nullable: true)]
    private ?string $nom = null;

    #[ORM\Column(nullable: true)]
    private ?int $numRue = null;

    #[ORM\Column(length: 75, nullable: true)]
    private ?string $rue = null;

    #[ORM\Column(length: 50, nullable: true)]
    private ?string $ville = null;

    #[ORM\Column(length: 12, nullable: true)]
    private ?string $numTel = null;

    #[ORM\Column(length: 100, nullable: true)]
    private ?string $mail = null;

    #[ORM\Column(nullable: true)]
    private ?int $copos = null;

    #[ORM\OneToMany(mappedBy: 'societe', targetEntity: Associe::class)]
    private Collection $associes;

    #[ORM\OneToMany(mappedBy: 'societe', targetEntity: Immeuble::class)]
    private Collection $immeubles;

    public function __construct()
    {
        $this->associes = new ArrayCollection();
        $this->immeubles = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getNom(): ?string
    {
        return $this->nom;
    }

    public function setNom(?string $nom): self
    {
        $this->nom = $nom;

        return $this;
    }

    public function getNumRue(): ?int
    {
        return $this->numRue;
    }

    public function setNumRue(?int $numRue): self
    {
        $this->numRue = $numRue;

        return $this;
    }

    public function getRue(): ?string
    {
        return $this->rue;
    }

    public function setRue(?string $rue): self
    {
        $this->rue = $rue;

        return $this;
    }

    public function getVille(): ?string
    {
        return $this->ville;
    }

    public function setVille(?string $ville): self
    {
        $this->ville = $ville;

        return $this;
    }

    public function getNumTel(): ?string
    {
        return $this->numTel;
    }

    public function setNumTel(?string $numTel): self
    {
        $this->numTel = $numTel;

        return $this;
    }

    public function getMail(): ?string
    {
        return $this->mail;
    }

    public function setMail(?string $mail): self
    {
        $this->mail = $mail;

        return $this;
    }

    public function getCopos(): ?int
    {
        return $this->copos;
    }

    public function setCopos(?int $copos): self
    {
        $this->copos = $copos;

        return $this;
    }

    /**
     * @return Collection<int, Associe>
     */
    public function getAssocies(): Collection
    {
        return $this->associes;
    }

    public function addAssocy(Associe $assocy): self
    {
        if (!$this->associes->contains($assocy)) {
            $this->associes->add($assocy);
            $assocy->setSociete($this);
        }

        return $this;
    }

    public function removeAssocy(Associe $assocy): self
    {
        if ($this->associes->removeElement($assocy)) {
            // set the owning side to null (unless already changed)
            if ($assocy->getSociete() === $this) {
                $assocy->setSociete(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection<int, Immeuble>
     */
    public function getImmeubles(): Collection
    {
        return $this->immeubles;
    }

    public function addImmeuble(Immeuble $immeuble): self
    {
        if (!$this->immeubles->contains($immeuble)) {
            $this->immeubles->add($immeuble);
            $immeuble->setSociete($this);
        }

        return $this;
    }

    public function removeImmeuble(Immeuble $immeuble): self
    {
        if ($this->immeubles->removeElement($immeuble)) {
            // set the owning side to null (unless already changed)
            if ($immeuble->getSociete() === $this) {
                $immeuble->setSociete(null);
            }
        }

        return $this;
    }
}
