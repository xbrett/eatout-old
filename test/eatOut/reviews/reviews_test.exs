defmodule EatOut.ReviewsTest do
  use EatOut.DataCase

  alias EatOut.Reviews

  describe "reviews" do
    alias EatOut.Reviews.Review

    @valid_attrs %{desc: "some desc", rating: 42, rest_id: 42}
    @update_attrs %{desc: "some updated desc", rating: 43, rest_id: 43}
    @invalid_attrs %{desc: nil, rating: nil, rest_id: nil}

    def review_fixture(attrs \\ %{}) do
      {:ok, review} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Reviews.create_review()

      review
    end

    test "list_reviews/0 returns all reviews" do
      review = review_fixture()
      assert Reviews.list_reviews() == [review]
    end

    test "get_review!/1 returns the review with given id" do
      review = review_fixture()
      assert Reviews.get_review!(review.id) == review
    end

    test "create_review/1 with valid data creates a review" do
      assert {:ok, %Review{} = review} = Reviews.create_review(@valid_attrs)
      assert review.desc == "some desc"
      assert review.rating == 42
      assert review.rest_id == 42
    end

    test "create_review/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Reviews.create_review(@invalid_attrs)
    end

    test "update_review/2 with valid data updates the review" do
      review = review_fixture()
      assert {:ok, %Review{} = review} = Reviews.update_review(review, @update_attrs)
      assert review.desc == "some updated desc"
      assert review.rating == 43
      assert review.rest_id == 43
    end

    test "update_review/2 with invalid data returns error changeset" do
      review = review_fixture()
      assert {:error, %Ecto.Changeset{}} = Reviews.update_review(review, @invalid_attrs)
      assert review == Reviews.get_review!(review.id)
    end

    test "delete_review/1 deletes the review" do
      review = review_fixture()
      assert {:ok, %Review{}} = Reviews.delete_review(review)
      assert_raise Ecto.NoResultsError, fn -> Reviews.get_review!(review.id) end
    end

    test "change_review/1 returns a review changeset" do
      review = review_fixture()
      assert %Ecto.Changeset{} = Reviews.change_review(review)
    end
  end
end
