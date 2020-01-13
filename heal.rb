module Heal

  def heal
    req_mana = 6
    if self.has_mana?(req_mana)
      @mana-=req_mana
      @hp+=rand(6..10)
      hp_overload?
    end
  end

  def hp_overload?
    @hp = self.class::HP if @hp > self.class::HP
  end
end