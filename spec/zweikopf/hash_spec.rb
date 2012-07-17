require 'spec_helper'

describe Zweikopf::Hash do
  describe :empty do
    let(:empty_hash) { load_fixture(:empty_hash) }

    it "returns empty clojure hash" do
      Zweikopf::Hash.empty.should eql empty_hash
    end
  end

  describe :create do


    context "when given a non-recursive hash structure" do

      #
      # Environment
      #

      let(:hash) { load_fixture(:clj_hash1) }

      #
      # Examples
      #

      it "creates a Clojure hash" do
        Zweikopf::Hash.create({:a => 1, :b => 2}).should eql hash
      end
    end

    context "when given a recursive hash structure" do

      #
      # Environment
      #

      let(:hash) { load_fixture(:clj_deep_hash1) }

      #
      # Examples
      #

      it "creates a Clojure hash" do
        Zweikopf::Hash.create({:a => 1, :b => {:c => 3, :d =>4}}).should eql hash
      end
    end
  end

  describe :from_clj do
    context "given a non-recursive clojure hash structure" do

      #
      # Environment
      #

      let(:clj_hash) { load_fixture(:clj_hash1) }

      #
      # Examples
      #

      it "creates a Ruby hash" do
        Zweikopf::Hash.from_clj(clj_hash).should eql({:a => 1, :b => 2})
      end
    end

    context "when given a recursive hash structure" do

      #
      # Environment
      #

      let(:clj_hash) { load_fixture(:clj_deep_hash1) }

      #
      # Examples
      #

      it "creates a Clojure hash" do
        Zweikopf::Hash.from_clj(clj_hash).should eql({:a => 1, :b => {:c => 3, :d =>4}})
      end
    end

    context "when given a clojure array" do

      #
      # Environment
      #

      let(:clj_array) { load_fixture(:clj_array1) }

      #
      # Examples
      #

      it "creates a Ruby array" do
        #
      end
    end
  end
end
