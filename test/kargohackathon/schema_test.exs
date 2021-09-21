defmodule Kargohackathon.SchemaTest do
  use Kargohackathon.DataCase

  alias Kargohackathon.Schema

  describe "staff" do
    alias Kargohackathon.Schema.Staff

    @valid_attrs %{country: "some country", dob: ~D[2010-04-17], first_name: "some first_name", id_card: "some id_card", last_name: "some last_name", phone_number: "some phone_number", status: "some status"}
    @update_attrs %{country: "some updated country", dob: ~D[2011-05-18], first_name: "some updated first_name", id_card: "some updated id_card", last_name: "some updated last_name", phone_number: "some updated phone_number", status: "some updated status"}
    @invalid_attrs %{country: nil, dob: nil, first_name: nil, id_card: nil, last_name: nil, phone_number: nil, status: nil}

    def staff_fixture(attrs \\ %{}) do
      {:ok, staff} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Schema.create_staff()

      staff
    end

    test "list_staff/0 returns all staff" do
      staff = staff_fixture()
      assert Schema.list_staff() == [staff]
    end

    test "get_staff!/1 returns the staff with given id" do
      staff = staff_fixture()
      assert Schema.get_staff!(staff.id) == staff
    end

    test "create_staff/1 with valid data creates a staff" do
      assert {:ok, %Staff{} = staff} = Schema.create_staff(@valid_attrs)
      assert staff.country == "some country"
      assert staff.dob == ~D[2010-04-17]
      assert staff.first_name == "some first_name"
      assert staff.id_card == "some id_card"
      assert staff.last_name == "some last_name"
      assert staff.phone_number == "some phone_number"
      assert staff.status == "some status"
    end

    test "create_staff/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Schema.create_staff(@invalid_attrs)
    end

    test "update_staff/2 with valid data updates the staff" do
      staff = staff_fixture()
      assert {:ok, %Staff{} = staff} = Schema.update_staff(staff, @update_attrs)
      assert staff.country == "some updated country"
      assert staff.dob == ~D[2011-05-18]
      assert staff.first_name == "some updated first_name"
      assert staff.id_card == "some updated id_card"
      assert staff.last_name == "some updated last_name"
      assert staff.phone_number == "some updated phone_number"
      assert staff.status == "some updated status"
    end

    test "update_staff/2 with invalid data returns error changeset" do
      staff = staff_fixture()
      assert {:error, %Ecto.Changeset{}} = Schema.update_staff(staff, @invalid_attrs)
      assert staff == Schema.get_staff!(staff.id)
    end

    test "delete_staff/1 deletes the staff" do
      staff = staff_fixture()
      assert {:ok, %Staff{}} = Schema.delete_staff(staff)
      assert_raise Ecto.NoResultsError, fn -> Schema.get_staff!(staff.id) end
    end

    test "change_staff/1 returns a staff changeset" do
      staff = staff_fixture()
      assert %Ecto.Changeset{} = Schema.change_staff(staff)
    end
  end
end
