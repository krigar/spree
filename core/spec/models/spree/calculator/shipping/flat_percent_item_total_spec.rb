require 'spec_helper'

module Spree
  module Calculator::Shipping
    describe FlatPercentItemTotal do
      let(:variant1) { build(:variant, :price => 10.11) }
      let(:variant2) { build(:variant, :price => 20.2222) }

      let(:line_item1) { build(:line_item, variant: variant1) }
      let(:line_item2) { build(:line_item, variant: variant2) }

      let(:package) do
        build(:stock_package, variants_contents: { variant1 => 2, variant2 => 1 })
      end

      subject { FlatPercentItemTotal.new(:preferred_flat_percent => 10) }

      it "should round result correctly" do
        subject.compute(package).should == 4.04
      end
    end
  end
end
