<?php

namespace App\Form;

use App\Entity\Bail;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\IntegerType;
use Symfony\Component\Form\Extension\Core\Type\NumberType;
use Symfony\Component\Form\Extension\Core\Type\DateType;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\Extension\Core\Type\DateTimeType;

class BailType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('dateDebut', DateType::class, array('label'=>'  '))
            ->add('montantHC', NumberType::class, array('label'=>'  '))
            ->add('montantCharges', NumberType::class, array('label'=>'  '))
            ->add('montantCaution', NumberType::class, array('label'=>'  '))
            ->add('nomCaution1', TextType::class, array('label'=>'  '))
            ->add('nomCaution2', TextType::class, array('label'=>'  '))
            ->add('dateFin', DateType::class, array('label'=>'  '))
            ->add('dureeBail', TextType::class, array('label'=>'  '))
            ->add('bailSigne', TextType::class, array('label'=>'  '))
            ->add('etatLieuEntree', TextType::class, array('label'=>'  '))
            ->add('etatLieuSortie', TextType::class, array('label'=>'  '))
            ->add('attestationAssurance', TextType::class, array('label'=>'  '))
            ->add('montantPremEcheance', NumberType::class, array('label'=>'  '))
            ->add('montantDerEcheance', NumberType::class, array('label'=>'  '))
            ->add('archive', IntegerType::class, array('label'=>'  '))
            ->add('appartement', EntityType::class, array('class'=>'App\Entity\Appartement',
                                                    'choice_label'=>
                                                                    function ($appart) {
                                                                        $porte= $appart->getPorte();
                                                                        return strtoupper($porte);
                                                                    }, 
                                                    'label'=>'  '))
            
            
            ->add('associe', EntityType::class, array('class'=>'App\Entity\Associe',
                                                'choice_label'=>
                                                                function ($asso) {
                                                                    $prenom= $asso->getPrenom();
                                                                    $nom= $asso->getNom();
                                                                    return strtoupper($nom)." ".$prenom;
                                                                }, 
                                                'label'=>'  '))
            
            
            ->add('locataires', EntityType::class, array('class'=>'App\Entity\Locataire',
                                                    'choice_label'=>
                                                                    function ($loc) {
                                                                        $prenom= $loc->getPrenom();
                                                                        $nom= $loc->getNom();
                                                                        return strtoupper($nom)." ".$prenom;
                                                                    }, 
                                                    'label'=>'  '))
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Bail::class,
        ]);
    }
}
