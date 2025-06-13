class LocomotiveEngineer
  def self.generate_list_of_wagons(*wagons_ID)
    #任意の数の貨車ID（正の整数）を受け取り、それらを1つの配列として返します
    wagons_ID
  end

  def self.fix_list_of_wagons(each_wagons_id, missing_wagons)
    #2つの配列（貨車IDのリスト）を受け取り、上記の修正を加えて、最終的な配列を返します
    #列車のIDシステムでは、機関車は必ずID 1 です。
    #最初の2つの貨車が間違った位置にあります。これらをリストの最後に移動させてください。
    #さらに、不足している貨車IDのリスト（2つ目の配列）が見つかりました。このIDたちは、機関車（ID 1）のすぐ後ろに追加する必要があります。
    a, b, *rest_of_wagons= each_wagons_id
    first_two = [a, b]
    locomotive_index = rest_of_wagons.index(1)
    before_locomotive = rest_of_wagons[0...locomotive_index]
    after_locomotive = rest_of_wagons[locomotive_index + 1..-1]
    each_wagons_id = [1, *missing_wagons, *after_locomotive, *first_two]
  end

  def self.add_missing_stops(route_hash, **stops_data)
    sorted_stops = stops_data.sort_by { |key, _value| key.to_s.gsub('stop_', '').to_i }
    stop_names = sorted_stops.map { |_key, value| value }
    { **route_hash, stops: stop_names }
  end

  def self.extend_route_information(route, more_route_information)
    #出発地と目的地が含まれる最初のハッシュに、速度や長さなどの他の詳細情報（2つ目のハッシュ）を統合して、すべての情報を含む1つのハッシュを返してほしいのです。
    #2つ目のハッシュには、例にないプロパティが含まれることもあります。これは2つのハッシュを受け取り、すべての経路情報が統合されたハッシュを返します。
    route.merge(more_route_information)
  end
end
