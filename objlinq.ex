defmodule ObjLinq do
  @moduledoc """
  Elixir implementation of .net LINQ functions.
  """

  @doc """
  Applies the boolean clause to each element in the collecion.

  Example
  Enum.to_list(Linq.where([1,2,3],&(&1 == 1)))
  """
  @spec where(Enumerable.t, fun()) :: Enumerable.t
  def where(collection, clause) when is_function(clause, 1) do
    Stream.filter(collection, clause)
  end

  @doc """
  Transforms enumerable by applying clause to each element in the collection.

  Example
  Linq.select([1,2,3],&(&1 + 1)) |> Enum.to_list
  """
  @spec select(Enumerable.t, fun()) :: Enumerable.t
  def select(collection, clause) when is_function(clause, 1) do
    Stream.map(collection, clause)
  end

  @doc """
  Flattens one level of a collection.

  Example
  Linq.select_many([[1,2],[3,4]])|> Enum.to_list
  """
  @spec select_many(Enumerable.t) :: Enumerable.t
  def select_many(collection) do
    Stream.flat_map(collection, &(&1))
  end

  @doc """
  Performs select while flattening one level of the collection

  Example
  Linq.select_many([[1,2],[3,4]], &(&1)) |> Enum.to_list
  """
  @spec select_many(Enumerable.t, fun()) :: Enumerable.t
  def select_many(collection, clause) when is_function(clause, 1) do
    Stream.flat_map(collection, clause)
  end

  @doc """
  Counts the number of items in the collection
  Example
  Linq.count([1,2,3])
  """
  @spec count(Enumerable.t) :: number()
  def count(collection) do
    Enum.count(collection)
  end

end
