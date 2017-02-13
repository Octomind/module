<?php
class Pagination{
    public $buttons = array();

    public function __construct($currentPage = 1, $itemCount = 200, $itemPerPage = 5)
    {

		
        $pagesCount = ceil($itemCount/$itemPerPage);
		
		$this->buttons[] = new Button($currentPage - 1, $currentPage > 1, 'Previous');

			for($i = 1; $i <= $pagesCount; $i++){
				$active = $currentPage != $i;
				$this->buttons[] = new Button($i, $active);
			}
			
		$this->buttons[] = new Button($currentPage + 1, $currentPage < $pagesCount, 'Next');
		
			if (!$currentPage) {
				return;
			}

			if ($pagesCount == 1) {
				return;
			}

			if ($currentPage > $pagesCount) {
				$currentPage = $pagesCount;
			}
		
		
        

    }
}