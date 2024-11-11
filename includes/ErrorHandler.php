<?php

class ErrorHandler {
    private $error_message;
    public function __construct() {
        set_error_handler([$this, 'handleError']);
        set_exception_handler([$this, 'handleException']);
    }
    public function handleError($errno, $errstr, $errfile, $errline): bool
    {
        $this->error_message = "Ошибка [$errno]: $errstr в файле $errfile на строке $errline";
        $this->displayError();
        return true;
    }
    public function handleException($exception): void
    {
        $this->error_message = "Исключение: " . $exception->getMessage() .
            " в файле " . $exception->getFile() .
            " на строке " . $exception->getLine();
        $this->displayError();
    }

    private function displayError(): void
    {
        if ($this->error_message) {
            echo "<div style='color: #D8000C; background-color: #FFBABA; padding: 10px; border: 1px solid #D8000C; border-radius: 5px; width: 60%; margin: 1em auto;'>";
            echo $this->error_message;
            echo "</div>";
        }
    }
}
new ErrorHandler();