class Journey

  $PENALTY = 6
  $MINV = 1

  attr_accessor :entry_station, :exit_station

  def initialize(args)
    @entry_station = args[:entry_station] || nil
    @exit_station = args[:exit_station] || nil
  end

  def fare
    return $PENALTY if incomplete?
    $MINV
  end

  def incomplete?
    exit_station.nil? || entry_station.nil?
  end

end
