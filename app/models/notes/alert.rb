class Alert < Note
  typed_store :data, coder: JSON do |s|
    s.datetime :alert_at
  end
end