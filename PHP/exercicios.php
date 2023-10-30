<!DOCTYPE html>
<html>
<body>

<?php
        function teste(){
            $nomes = ['Francisco Souza', 'Guilherme Rosa', 'Arthur Golveia'];
            $cliente1 = new stdClass();
            $cliente1->nome = $nomes[0];
            $cliente2 = new stdClass();
            $cliente2->nome = $nomes[1];
            $cliente3 = new stdClass();
            $cliente3->nome = $nomes[2];
            $arrayDeClientes = [$cliente1, $cliente2, $cliente3];
    
            $arrayDeNascimento = [
                'Francisco Souza' => '10-12-1996',
                'Arthur Golveia' => '14-01-2000',
                'Guilherme Rosa' => '26-05-1985',
                'Marcelo Planalto' => '26-05-1985'
            ];
    
            foreach($arrayDeClientes as $cliente){
                $cliente->dataDeNascimento = $arrayDeNascimento[$cliente->nome];
            }
            
            echo($arrayDeClientes[1]->nome." <br/><br/>");
            $arrayDeClientes = ordenarClientes($arrayDeClientes);
            printClientes($arrayDeClientes);
        }
    
        function printClientes($clientes){
            foreach($clientes as $cliente){
                echo ($cliente->nome ." nascido em ". $cliente->dataDeNascimento ." <br/>"); 
            }
        }
    
        function ordenarClientes($clientes){
            $clientesOrdenados = $clientes;
            for($j = 0; $j<count($clientes);$j++){
                $position = 0;
                $cliente = $clientes[$j];
                $data = getDateSize($cliente->dataDeNascimento);
    
                for($i = 0; $i<count($clientes);$i++){
                    if($data < getDateSize($clientes[$i]->dataDeNascimento)){
                        $position += 1;
                    }  
                } 
                $clientesOrdenados[$position] = $cliente;
             
            }
            
            return $clientesOrdenados;
        }
    
        function getDateSize($dateStr){
            $dateStr = explode("-", $dateStr);
            $date = date_create($dateStr[2]."-".$dateStr[1]."-".$dateStr[0]);
            $datetime2 = date_create('1-1-1');
            $interval = date_diff($date, $datetime2);
            
            return $interval->days;
        }
        teste();
?>

</body>
</html>
