<?php

namespace App\Controller\astronauts;

use App\Entity\Astronaut;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Form\Extension\Core\Type\DateType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class AstronautController extends AbstractController
{

    /**
     * @Route("/", name="index")
     */
    public function Homepage(){
        $astronauts = $this->getDoctrine()->getRepository(Astronaut::class)
        ->findAll();
        return $this->render('astronaut/list.html.twig', [
            'astronauts' => $astronauts
        ]);
    }

    /**
     * @Route("/add-astronaut", name="add-astronaut", methods={"GET","POST"})
     */
    public function addAstronaut(Request $request){
        $astronaut = new Astronaut();

        $form = $this->createFormBuilder($astronaut)
            ->add('name', TextType::class, [
                'attr' => array('class' => 'form-control')
            ])
            ->add('superpower', TextType::class, [
                'attr' => array('class' => 'form-control')
            ])
            ->add('birth_date', DateType::class,[
                'attr' => array('class' => 'form-control')
            ])
            ->add('save', SubmitType::class,[
                'label' => 'Vytvořit',
                'attr' => array('class' => 'btn btn-primary mt-3')
            ])
            ->getForm();

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()){
            $astronaut = $form->getData();

            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($astronaut);
            $entityManager->flush();

            return $this->redirectToRoute('index');
        }

        return $this->render('astronaut/add.html.twig', [
            'form' => $form->createView(),
        ]);

    }

    /**
     * @Route("/edit-astronaut/{id}", name="edit-astronaut")
     */
    public function editAstronaut(Request $request, $id){
        $astronaut = new Astronaut();
        $astronaut = $this->getDoctrine()->getRepository(Astronaut::class)->find($id);

        $form = $this->createFormBuilder($astronaut)
            ->add('name', TextType::class, [
                'attr' => array('class' => 'form-control')
            ])
            ->add('superpower', TextType::class, [
                'attr' => array('class' => 'form-control')
            ])
            ->add('birth_date', DateType::class,[
                'attr' => array('class' => 'form-control')
            ])
            ->add('save', SubmitType::class,[
                'label' => 'Upravit',
                'attr' => array('class' => 'btn btn-primary mt-3')
            ])
            ->getForm();

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()){
            $astronaut = $form->getData();

            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($astronaut);
            $entityManager->flush();

            return $this->redirectToRoute('index');
        }

        return $this->render('astronaut/edit.html.twig', [
            'form' => $form->createView(),
        ]);

    }

    /**
     * @Route("delete-astronaut/{id}", name="delete-astronaut")
     */
    public function deleteAstronaut($id){
        $astronaut = $this->getDoctrine()->getRepository(Astronaut::class)->find($id);

        $entityManager = $this->getDoctrine()->getManager();
        $entityManager->remove($astronaut);
        $entityManager->flush();

        $response = new Response();
        return new JsonResponse('Deleted successfull',200);

    }


}