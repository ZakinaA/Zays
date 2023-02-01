<?php

namespace App\Form;

use App\Entity\Bail;
use App\Entity\Locataire;
use App\Entity\Appartement;
use App\Entity\Associe;
use App\Form\LocataireType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\IntegerType;
use Symfony\Component\Form\Extension\Core\Type\NumberType;
use Symfony\Component\Form\Extension\Core\Type\DateType;
use Symfony\Component\Form\Extension\Core\Type\CollectionType; 
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\Extension\Core\Type\DateTimeType;

class BailType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('dateDebut', DateType::class, ['label'=>false])
            ->add('montantHC', NumberType::class, ['label'=>false])
            ->add('montantCharges', NumberType::class, ['data'=>30, 'label'=>false])
            ->add('montantCaution', NumberType::class, ['label'=>false])
            ->add('nomCaution1', TextType::class, ['label'=>false])
            ->add('nomCaution2', TextType::class, ['label'=>false, 'required'=>false])
            ->add('dateFin', DateType::class, ['label'=>false, 'required'=>false])
            ->add('dureeBail', TextType::class, ['data'=>"6 ans", 'label'=>false, 'required'=>false])
            ->add('bailSigne', TextType::class, ['label'=>false, 'required'=>false])
            ->add('etatLieuEntree', TextType::class, ['label'=>false, 'required'=>false])
            ->add('etatLieuSortie', TextType::class, ['label'=>false, 'required'=>false])
            ->add('attestationAssurance', TextType::class, ['label'=>false, 'required'=>false])
            ->add('montantPremEcheance', NumberType::class, ['label'=>false, 'required'=>false])
            ->add('montantDerEcheance', NumberType::class, ['label'=>false, 'required'=>false])
            ->add('archive', IntegerType::class, ['label'=>false, 'required'=>false])
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
                                                'label'=>'  ', 'required'=>false))
            
            
            ->add('locataires', CollectionType::class, ['entry_type' => LocataireType::class,
                                                'entry_options' => ['label' => false],])        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Bail::class,
        ]);
    }
}
