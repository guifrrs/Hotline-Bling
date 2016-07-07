library IEEE;
use IEEE.std_logic_1164.all;

entity Topo_Final is
  port ();
end Topo_Final;

architecture bhv_topoFinal of Topo_Final is
  
  component Topo_Registrador
    port ();
  end component;
  
  component Topo_Seletor
    port ();
  end component;
  
  component Topo_Compadador
    port ();
  end component;
  
  component Topo_BlocoContador
    port ();
  end component;
  
  component Topo_Controlador
    port ();
  end component;
  
  begin
  


end bhv_topoFinal;
