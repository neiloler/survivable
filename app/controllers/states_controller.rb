class StatesController < ApplicationController

  def index

    survivabilitySortedStates = State.order(population_military: :desc, population_total: :asc, housing_units_total: :asc, housing_units_occupied: :asc, housing_units_vacant: :desc)

    @safestPlaces = survivabilitySortedStates.first(10)
    @scariestPlaces = survivabilitySortedStates.last(10)
end
