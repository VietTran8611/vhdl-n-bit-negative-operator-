library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
package mypack is
 type myarray is array (NATURAL range <>) of bit; 
 function "-"(x:myarray) return myarray;
end package mypack;
 
package body mypack is
 function "-"(x:myarray) return myarray is
  variable carry: bit:='0';
  variable z: myarray(x'length-1 downto 0);
  begin
   for k in 0 to x'length-1 loop
    z(k) := x(k) xor carry;    -- you can derive these by making a truth table
    carry :=  carry or x(k);  -- and then extrapolating to generic n-bits
   end loop;  
  return z;
 end "-"; 
end mypack;

use work.mypack.all;

entity Negator is port (
  i: in  myarray(3 downto 0);
  j: out myarray(3 downto 0)  ); 
end Negator;

architecture Behavioral of Negator is
begin
     j <=  -i ;
end Behavioral;
