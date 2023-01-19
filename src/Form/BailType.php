<?php

namespace App\Form;

use App\Entity\Bail;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class BailType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('dateDebut')
            ->add('montantHC')
            ->add('montantCharges')
            ->add('montantCaution')
            ->add('nomCaution1')
            ->add('nomCaution2')
            ->add('dateFin')
            ->add('dureeBail')
            ->add('bailSigne')
            ->add('etatLieuEntree')
            ->add('etatLieuSortie')
            ->add('attestationAssurance')
            ->add('montantPremEcheance')
            ->add('montantDerEcheance')
            ->add('archive')
            ->add('appartement')
            ->add('associe')
            ->add('locataires')
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Bail::class,
        ]);
    }
}
