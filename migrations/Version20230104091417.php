<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20230104091417 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE appartement (id INT AUTO_INCREMENT NOT NULL, immeuble_id INT DEFAULT NULL, porte INT DEFAULT NULL, surface DOUBLE PRECISION DEFAULT NULL, surface_sol DOUBLE PRECISION DEFAULT NULL, situation VARCHAR(50) DEFAULT NULL, equipements VARCHAR(255) DEFAULT NULL, travaux VARCHAR(255) DEFAULT NULL, ventilation VARCHAR(255) DEFAULT NULL, INDEX IDX_71A6BD8D63768E3F (immeuble_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE associe (id INT AUTO_INCREMENT NOT NULL, societe_id INT DEFAULT NULL, nom VARCHAR(50) DEFAULT NULL, prenom VARCHAR(50) DEFAULT NULL, num_rue INT DEFAULT NULL, rue VARCHAR(75) DEFAULT NULL, copos INT DEFAULT NULL, ville VARCHAR(50) DEFAULT NULL, num_tel VARCHAR(12) DEFAULT NULL, mail VARCHAR(100) DEFAULT NULL, nb_part VARCHAR(50) DEFAULT NULL, INDEX IDX_235AAA4AFCF77503 (societe_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE bail (id INT AUTO_INCREMENT NOT NULL, appartement_id INT DEFAULT NULL, associe_id INT DEFAULT NULL, date_debut DATE DEFAULT NULL, montant_hc DOUBLE PRECISION DEFAULT NULL, montant_charges DOUBLE PRECISION DEFAULT NULL, montant_caution DOUBLE PRECISION DEFAULT NULL, nom_caution1 VARCHAR(50) DEFAULT NULL, nom_caution2 VARCHAR(50) DEFAULT NULL, date_fin DATE DEFAULT NULL, duree_bail VARCHAR(50) DEFAULT NULL, bail_signe VARCHAR(50) DEFAULT NULL, etat_lieu_entree VARCHAR(150) DEFAULT NULL, etat_lieu_sortie VARCHAR(150) DEFAULT NULL, attestation_assurance VARCHAR(50) DEFAULT NULL, montant_prem_echeance DOUBLE PRECISION DEFAULT NULL, montant_der_echeance DOUBLE PRECISION DEFAULT NULL, archive INT DEFAULT NULL, INDEX IDX_945BC1EE1729BBA (appartement_id), INDEX IDX_945BC1EC41A218C (associe_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE bail_locataire (bail_id INT NOT NULL, locataire_id INT NOT NULL, INDEX IDX_EA325C7E3E3F1FE8 (bail_id), INDEX IDX_EA325C7ED8A38199 (locataire_id), PRIMARY KEY(bail_id, locataire_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE categorie (id INT AUTO_INCREMENT NOT NULL, libelle VARCHAR(100) DEFAULT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE immeuble (id INT AUTO_INCREMENT NOT NULL, societe_id INT DEFAULT NULL, nom VARCHAR(50) DEFAULT NULL, num_rue INT DEFAULT NULL, rue VARCHAR(75) DEFAULT NULL, copos INT DEFAULT NULL, ville VARCHAR(50) DEFAULT NULL, INDEX IDX_467D53F9FCF77503 (societe_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE locataire (id INT AUTO_INCREMENT NOT NULL, nom VARCHAR(50) DEFAULT NULL, prenom VARCHAR(50) DEFAULT NULL, date_naissance DATE DEFAULT NULL, lieu_naissance VARCHAR(50) DEFAULT NULL, montant_caf DOUBLE PRECISION DEFAULT NULL, archive INT DEFAULT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE mois_annee (id INT AUTO_INCREMENT NOT NULL, date_mois_annee DATE DEFAULT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE mouvement (id INT AUTO_INCREMENT NOT NULL, sous_categorie_id INT DEFAULT NULL, montant_p DOUBLE PRECISION DEFAULT NULL, libelle VARCHAR(50) DEFAULT NULL, debit DOUBLE PRECISION DEFAULT NULL, credit DOUBLE PRECISION DEFAULT NULL, INDEX IDX_5B51FC3E365BF48 (sous_categorie_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE paiement (id INT AUTO_INCREMENT NOT NULL, bail_id INT DEFAULT NULL, mois_annee_id INT DEFAULT NULL, date_p DATE DEFAULT NULL, montant DOUBLE PRECISION DEFAULT NULL, source VARCHAR(100) DEFAULT NULL, INDEX IDX_B1DC7A1E3E3F1FE8 (bail_id), INDEX IDX_B1DC7A1EB67D0DC3 (mois_annee_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE piece_jointe (id INT AUTO_INCREMENT NOT NULL, type_piece_jointe_id INT DEFAULT NULL, locataire_id INT DEFAULT NULL, libelle VARCHAR(100) DEFAULT NULL, nom_fichier VARCHAR(100) DEFAULT NULL, INDEX IDX_AB5111D454408E71 (type_piece_jointe_id), INDEX IDX_AB5111D4D8A38199 (locataire_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE societe (id INT AUTO_INCREMENT NOT NULL, nom VARCHAR(50) DEFAULT NULL, num_rue INT DEFAULT NULL, rue VARCHAR(75) DEFAULT NULL, ville VARCHAR(50) DEFAULT NULL, num_tel VARCHAR(12) DEFAULT NULL, mail VARCHAR(100) DEFAULT NULL, copos INT DEFAULT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE sous_categorie (id INT AUTO_INCREMENT NOT NULL, categorie_id INT DEFAULT NULL, libelle VARCHAR(100) DEFAULT NULL, INDEX IDX_52743D7BBCF5E72D (categorie_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE type_piece_jointe (id INT AUTO_INCREMENT NOT NULL, libelle VARCHAR(100) DEFAULT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE messenger_messages (id BIGINT AUTO_INCREMENT NOT NULL, body LONGTEXT NOT NULL, headers LONGTEXT NOT NULL, queue_name VARCHAR(190) NOT NULL, created_at DATETIME NOT NULL, available_at DATETIME NOT NULL, delivered_at DATETIME DEFAULT NULL, INDEX IDX_75EA56E0FB7336F0 (queue_name), INDEX IDX_75EA56E0E3BD61CE (available_at), INDEX IDX_75EA56E016BA31DB (delivered_at), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE appartement ADD CONSTRAINT FK_71A6BD8D63768E3F FOREIGN KEY (immeuble_id) REFERENCES immeuble (id)');
        $this->addSql('ALTER TABLE associe ADD CONSTRAINT FK_235AAA4AFCF77503 FOREIGN KEY (societe_id) REFERENCES societe (id)');
        $this->addSql('ALTER TABLE bail ADD CONSTRAINT FK_945BC1EE1729BBA FOREIGN KEY (appartement_id) REFERENCES appartement (id)');
        $this->addSql('ALTER TABLE bail ADD CONSTRAINT FK_945BC1EC41A218C FOREIGN KEY (associe_id) REFERENCES associe (id)');
        $this->addSql('ALTER TABLE bail_locataire ADD CONSTRAINT FK_EA325C7E3E3F1FE8 FOREIGN KEY (bail_id) REFERENCES bail (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE bail_locataire ADD CONSTRAINT FK_EA325C7ED8A38199 FOREIGN KEY (locataire_id) REFERENCES locataire (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE immeuble ADD CONSTRAINT FK_467D53F9FCF77503 FOREIGN KEY (societe_id) REFERENCES societe (id)');
        $this->addSql('ALTER TABLE mouvement ADD CONSTRAINT FK_5B51FC3E365BF48 FOREIGN KEY (sous_categorie_id) REFERENCES sous_categorie (id)');
        $this->addSql('ALTER TABLE paiement ADD CONSTRAINT FK_B1DC7A1E3E3F1FE8 FOREIGN KEY (bail_id) REFERENCES bail (id)');
        $this->addSql('ALTER TABLE paiement ADD CONSTRAINT FK_B1DC7A1EB67D0DC3 FOREIGN KEY (mois_annee_id) REFERENCES mois_annee (id)');
        $this->addSql('ALTER TABLE piece_jointe ADD CONSTRAINT FK_AB5111D454408E71 FOREIGN KEY (type_piece_jointe_id) REFERENCES type_piece_jointe (id)');
        $this->addSql('ALTER TABLE piece_jointe ADD CONSTRAINT FK_AB5111D4D8A38199 FOREIGN KEY (locataire_id) REFERENCES locataire (id)');
        $this->addSql('ALTER TABLE sous_categorie ADD CONSTRAINT FK_52743D7BBCF5E72D FOREIGN KEY (categorie_id) REFERENCES categorie (id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE appartement DROP FOREIGN KEY FK_71A6BD8D63768E3F');
        $this->addSql('ALTER TABLE associe DROP FOREIGN KEY FK_235AAA4AFCF77503');
        $this->addSql('ALTER TABLE bail DROP FOREIGN KEY FK_945BC1EE1729BBA');
        $this->addSql('ALTER TABLE bail DROP FOREIGN KEY FK_945BC1EC41A218C');
        $this->addSql('ALTER TABLE bail_locataire DROP FOREIGN KEY FK_EA325C7E3E3F1FE8');
        $this->addSql('ALTER TABLE bail_locataire DROP FOREIGN KEY FK_EA325C7ED8A38199');
        $this->addSql('ALTER TABLE immeuble DROP FOREIGN KEY FK_467D53F9FCF77503');
        $this->addSql('ALTER TABLE mouvement DROP FOREIGN KEY FK_5B51FC3E365BF48');
        $this->addSql('ALTER TABLE paiement DROP FOREIGN KEY FK_B1DC7A1E3E3F1FE8');
        $this->addSql('ALTER TABLE paiement DROP FOREIGN KEY FK_B1DC7A1EB67D0DC3');
        $this->addSql('ALTER TABLE piece_jointe DROP FOREIGN KEY FK_AB5111D454408E71');
        $this->addSql('ALTER TABLE piece_jointe DROP FOREIGN KEY FK_AB5111D4D8A38199');
        $this->addSql('ALTER TABLE sous_categorie DROP FOREIGN KEY FK_52743D7BBCF5E72D');
        $this->addSql('DROP TABLE appartement');
        $this->addSql('DROP TABLE associe');
        $this->addSql('DROP TABLE bail');
        $this->addSql('DROP TABLE bail_locataire');
        $this->addSql('DROP TABLE categorie');
        $this->addSql('DROP TABLE immeuble');
        $this->addSql('DROP TABLE locataire');
        $this->addSql('DROP TABLE mois_annee');
        $this->addSql('DROP TABLE mouvement');
        $this->addSql('DROP TABLE paiement');
        $this->addSql('DROP TABLE piece_jointe');
        $this->addSql('DROP TABLE societe');
        $this->addSql('DROP TABLE sous_categorie');
        $this->addSql('DROP TABLE type_piece_jointe');
        $this->addSql('DROP TABLE messenger_messages');
    }
}
