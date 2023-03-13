<?php
class HomePages extends Controller {

  public function index() {
    $data = [
      'title' => "Project Rocambolesque"
    ];
    $this->view('homepages/index', $data);
  }
}