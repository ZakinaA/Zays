<?php

namespace App\Entity;

use App\Repository\LocataireRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: LocataireRepository::class)]
class Locataire
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 50, nullable: true)]
    private ?string $nom = null;

    #[ORM\Column(length: 50, nullable: true)]
    private ?string $prenom = null;

    #[ORM\Column(type: Types::DATE_MUTABLE, nullable: true)]
    private ?\DateTimeInterface $dateNaissance = null;

    #[ORM\Column(length: 50, nullable: true)]
    private ?string $lieuNaissance = null;

    #[ORM\Column(nullable: true)]
    private ?float $montantCaf = null;

    #[ORM\Column(nullable: true)]
    private ?int $archive = null;

    #[ORM\OneToMany(mappedBy: 'locataire', targetEntity: PieceJointe::class)]
    private Collection $pieceJointes;

    #[ORM\ManyToMany(targetEntity: Bail::class, mappedBy: 'locataires')]
    private Collection $bails;

    public function __construct()
    {
        $this->pieceJointes = new ArrayCollection();
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

    public function getDateNaissance(): ?\DateTimeInterface
    {
        return $this->dateNaissance;
    }

    public function setDateNaissance(?\DateTimeInterface $dateNaissance): self
    {
        $this->dateNaissance = $dateNaissance;

        return $this;
    }

    public function getLieuNaissance(): ?string
    {
        return $this->lieuNaissance;
    }

    public function setLieuNaissance(?string $lieuNaissance): self
    {
        $this->lieuNaissance = $lieuNaissance;

        return $this;
    }

    public function getMontantCaf(): ?float
    {
        return $this->montantCaf;
    }

    public function setMontantCaf(?float $montantCaf): self
    {
        $this->montantCaf = $montantCaf;

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

    /**
     * @return Collection<int, PieceJointe>
     */
    public function getPieceJointes(): Collection
    {
        return $this->pieceJointes;
    }

    public function addPieceJointe(PieceJointe $pieceJointe): self
    {
        if (!$this->pieceJointes->contains($pieceJointe)) {
            $this->pieceJointes->add($pieceJointe);
            $pieceJointe->setLocataire($this);
        }

        return $this;
    }

    public function removePieceJointe(PieceJointe $pieceJointe): self
    {
        if ($this->pieceJointes->removeElement($pieceJointe)) {
            // set the owning side to null (unless already changed)
            if ($pieceJointe->getLocataire() === $this) {
                $pieceJointe->setLocataire(null);
            }
        }

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
            $bail->addLocataire($this);
        }

        return $this;
    }

    public function removeBail(Bail $bail): self
    {
        if ($this->bails->removeElement($bail)) {
            $bail->removeLocataire($this);
        }

        return $this;
    }
}
