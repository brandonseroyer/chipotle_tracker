require 'spec_helper'

describe Addict do
  it { should have_many(:relapses) }

  it("validates presence of name") do
    addict = Addict.new({:name => ''})
    expect(addict.save()).to(eq(false))
  end

  it("ensures the length of name is at least 1 character long") do
    addict = Addict.new({:name => ''.*(1)})
    expect(addict.save()).to(eq(false))
  end

  it("capitalize the name") do
    addict = Addict.create({:name => "trevor"})
    expect(addict.name()).to(eq("Trevor"))
  end

  it("adds a relapse to an addict") do
    test_addict = Addict.create({:name => 'me'})
    test_relapse = Relapse.create({:date => "1/1/1"})
    test_addict.relapses.push(test_relapse)
    expect(test_addict.relapses()).to(eq([test_relapse]))
    expect(Relapse.all()).to(eq([test_relapse]))
  end

end
