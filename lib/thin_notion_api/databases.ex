defmodule ThinNotionApi.Databases do
  @moduledoc """
  Module for interacting with the Notion Databases.
  """

  import ThinNotionApi.Base
  alias ThinNotionApi.Properties

  @doc """
  Retrieves a Database object using the ID specified.

  ## Examples

      iex> ThinNotionApi.Databases.retrieve_database(database_id)
      {:ok,
      %{
        "created_time" => "2021-06-11T20:34:00.000Z",
        "id" => "a4ef92b2-a798-4bae-8211-4817678cd2f4",
        "last_edited_time" => "2021-07-16T20:44:00.000Z",
        "object" => "database",
        "parent" => %{
          "page_id" => "9b4a624d-5a18-482a-b218-7e54166edda7",
          "type" => "page_id"
        },
        "properties" => %{
          "Name" => %{"id" => "title", "title" => %{}, "type" => "title"},
          "Tags" => %{
            "id" => "@Tnd",
            "multi_select" => %{"options" => []},
            "type" => "multi_select"
          }
        },
        "title" => [
          %{
            "annotations" => %{
              "bold" => false,
              "code" => false,
              "color" => "default",
              "italic" => false,
              "strikethrough" => false,
              "underline" => false
            },
            "href" => nil,
            "plain_text" => "Test Database",
            "text" => %{"content" => "Test Database", "link" => nil},
            "type" => "text"
          }
        ]
      }}
  """
  def retrieve_database(database_id) do
    get("databases/" <> database_id)
  end

  @doc """
  Gets a list of Pages contained in the database, filtered and ordered according to the filter conditions and sort criteria provided in the request. The response may contain fewer than page_size of results.

  ## Examples:
      iex> ThinNotionApi.Databases.query_database(database_id)
      {:ok,
        %{
          "has_more" => false,
          "next_cursor" => nil,
          "object" => "list",
          "results" => [
            %{
              "archived" => false,
              "created_time" => "2021-06-11T20:34:00.000Z",
              "id" => "0a8f7171-00b7-4f7e-a0b5-155f006186bb",
              "last_edited_time" => "2021-07-16T21:04:00.000Z",
              "object" => "page",
              "parent" => %{
                "database_id" => "a4ef92b2-a798-4bae-8211-4817678cd2f4",
                "type" => "database_id"
              },
              "properties" => %{
                "Name" => %{
                  "id" => "title",
                  "title" => [
                    %{
                      "annotations" => %{
                        "bold" => false,
                        "code" => false,
                        "color" => "default",
                        "italic" => false,
                        "strikethrough" => false,
                        "underline" => false
                      },
                      "href" => nil,
                      "plain_text" => "Hello World",
                      "text" => %{"content" => "Hello World", "link" => nil},
                      "type" => "text"
                    }
                  ],
                  "type" => "title"
                }
              },
              "url" => "https://www.notion.so/Hello-World-0a8f717100b74f7ea0b5155f006186bb"
            },
            ...
          ]
        }
      }

      iex> ThinNotionApi.Databases.query_database("a4ef92b2a7984bae82114817678cd2f4", %{ "page_size" => 1})
      {:ok,
        %{
          "has_more" => true,
          "next_cursor" => "700b4e34-697c-4fad-b97d-d9741d1fbaeb",
          "object" => "list",
          "results" => [
            %{
              "archived" => false,
              "created_time" => "2021-06-11T20:34:00.000Z",
              "id" => "0a8f7171-00b7-4f7e-a0b5-155f006186bb",
              "last_edited_time" => "2021-07-16T21:04:00.000Z",
              "object" => "page",
              "parent" => %{
                "database_id" => "a4ef92b2-a798-4bae-8211-4817678cd2f4",
                "type" => "database_id"
              },
              "properties" => %{
                "Name" => %{
                  "id" => "title",
                  "title" => [
                    %{
                      "annotations" => %{
                        "bold" => false,
                        "code" => false,
                        "color" => "default",
                        "italic" => false,
                        "strikethrough" => false,
                        "underline" => false
                      },
                      "href" => nil,
                      "plain_text" => "Hello World",
                      "text" => %{"content" => "Hello World", "link" => nil},
                      "type" => "text"
                    }
                  ],
                  "type" => "title"
                }
              },
              "url" => "https://www.notion.so/Hello-World-0a8f717100b74f7ea0b5155f006186bb"
            }
          ]
        }}
  """
  def query_database(database_id, body_params \\ %{}) do
    post("databases/" <> database_id <> "/query", body_params)
  end

  @doc """
  Gets a list of Pages contained in the database, filtered and ordered according to the filter conditions and sort criteria provided in the request. The response may contain fewer than page_size of results.

  ## Examples:
      iex> ThinNotionApi.Databases.create_database!("9b4a624d5a18482ab2187e54166edda7", "New Database")
      {:ok,
        %{
          "created_time" => "2021-07-30T20:44:00.000Z",
          "id" => "99315749-1f39-4095-9a40-449876f23f95",
          "last_edited_time" => "2021-07-30T20:44:00.000Z",
          "object" => "database",
          "parent" => %{
            "page_id" => "9b4a624d-5a18-482a-b218-7e54166edda7",
            "type" => "page_id"
          },
          "properties" => %{
            "Name" => %{
              "id" => "title",
              "name" => "Name",
              "title" => %{},
              "type" => "title"
            }
          },
          "title" => [
            %{
              "annotations" => %{
                "bold" => false,
                "code" => false,
                "color" => "default",
                "italic" => false,
                "strikethrough" => false,
                "underline" => false
              },
              "href" => nil,
              "plain_text" => "New Database",
              "text" => %{"content" => "New Database", "link" => nil},
              "type" => "text"
            }
          ]
        }
      }
  """
  @spec create_database!(atom(), String.t(), map()) :: any
  def create_database!(parent_id, title, properties \\ %{
    Name: %{
      title: %{}
    },
  }) do
    body_params = %{}
    |> set_parent(parent_id)
    |> Properties.set_title(title)
    |> Properties.set_database_properties(properties)

    post("databases", body_params)
  end

  @doc """
  Updates an existing database as specified by the parameters.
  """
  def update_database!(database_id, title, properties \\ %{
    Name: %{
      title: %{}
    },
  }) do
    body_params = %{}
    |> Properties.set_title(title)
    |> Properties.set_database_properties(properties)

    patch("databases/#{database_id}", body_params)
  end

  defp set_parent(map, parent_id) do
    Map.put(map, :parent, %{
      type: "page_id",
      page_id: parent_id
    })
  end
end
