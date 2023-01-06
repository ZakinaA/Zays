<?php

namespace App\Entity;

use App\Repository\AssocieRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: AssocieRepository::class)]
class Associe
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 50, nullable: true)]
    private ?string $nom = null;

    #[ORM\Column(length: 50, nullable: true)]
    private ?string $prenom = null;

    #[ORM\Column(nullable: true)]
    private ?int $numRue = null;

    #[ORM\Column(length: 75, nullable: true)]
    private ?string $rue = null;

    #[ORM\Column(nullable: true)]
    private ?int $copos = null;

    #[ORM\Column(length: 50, nullable: true)]
    private ?string $ville = null;

    #[ORM\Column(length: 12, nullable: true)]
    private ?string $numTel = null;

    #[ORM\Column(length: 100, nullable: true)]
    private ?string $mail = null;

    #[ORM\Column(length: 50, nullable: true)]
    private ?string $nbPart = null;

    #[ORM\ManyToOne(inversedBy: 'associes')]
    private ?Societe $societe = null;

    #[ORM\OneToMany(mappedBy: 'associe', targetEntity: Bail::class)]
    private Collection $bails;

    #[ORM\Column(length: 50, nullable: true)]
    private ?string $fonction = null;

    public function __construct()
    {
        $this->bails = new ArrayCollection();
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

    public function getPrenom(): ?string
    {
        return $this->prenom;
    }

    public function setPrenom(?string $prenom): self
    {
        $this->prenom = $prenom;

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

    public function getCopos(): ?int
    {
        return $this->copos;
    }

    public function setCopos(?int $copos): self
    {
        $this->copos = $copos;

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

    public function getNbPart(): ?string
    {
        return $this->nbPart;
    }

    public function setNbPart(?string $nbPart): self
    {
        $this->nbPart = $nbPart;

        return $this;
    }

    public function getSociete(): ?Societe
    {
        return $this->societe;
    }

    public function setSociete(?Societe $societe): self
    {
        $this->societe = $societe;

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
            $bail->setAssocie($this);
        }

        return $this;
    }

    public function removeBail(Bail $bail): self
    {
        if ($this->bails->removeElement($bail)) {
            // set the owning side to null (unless already changed)
            if ($bail->getAssocie() === $this) {
                $bail->setAssocie(null);
            }
        }

        return $this;
    }

    public function getFonction(): ?string
    {
        return $this->fonction;
    }

    public function setFonction(?string $fonction): self
    {
        $this->fonction = $fonction;

        return $this;
    }
}
