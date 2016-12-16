defmodule Pagination do   	
  defp f(i, maxElement) when i > maxElement + 1, do: {["...", i], i}  
  defp f(i, maxElement) when i > maxElement, do: {[i], i}  
  defp f(_, maxElement), do: {[], maxElement}
  def get(total, selected) do
  	pages = [1..3, selected-1..selected+1, total-2..total] 
		  	|> Enum.flat_map(&(&1))
		  	|> Enum.filter(&(&1 > 0 and &1 <= total)) 
		  	|> Enum.sort			  	
  	{result, _} = Enum.flat_map_reduce(pages, 0, &f/2)
  	result
  end
end