<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Component\HttpFoundation\Session\Session;

class HelloWorldController extends AbstractController
{
    private $session;

    public function __construct()
    {
        $this->session = new Session();
    }

    #[Route('/', name: 'index')]
    public function base()
    {
        return $this->redirectToRoute('indice');
    }
    #[Route('/es', name: 'es')]
    public function es(Request $request)
    {
        $request->getSession()->set('_locale', 'es');
        return $this->redirectToRoute('index');
    }
    #[Route('/hello-world', name: 'app_hello_world')]
    public function index(): Response
    {
        return $this->render('hello_world/index.html.twig', [
            'controller_name' => 'HelloWorldController',
        ]);
    }

}
