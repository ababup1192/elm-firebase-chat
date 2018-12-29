module Main exposing (Msg(..), chatForm)

import Browser
import Html exposing (..)
import Html.Attributes exposing (class, href, placeholder, type_)
import Html.Events exposing (onInput)



-- ---------------------------
-- MODEL
-- ---------------------------


type alias Model =
    {}


init : () -> ( Model, Cmd Msg )
init _ =
    ( {}, Cmd.none )



-- ---------------------------
-- UPDATE
-- ---------------------------


type Msg
    = UpdateComment String


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )



-- ---------------------------
-- VIEW
-- ---------------------------


view : Model -> Html Msg
view model =
    div [ class "page" ]
        [ section [ class "card" ]
            [ div [ class "card-header" ]
                [ text "Elm Chat"
                ]
            , div [ class "card-body" ]
                [ div [ class "media" ]
                    [ div [ class "media-left" ]
                        [ a [ href "#", class "icon-rounded" ] [ text "S" ]
                        ]
                    , div [ class "media-body" ]
                        [ h4 [ class "media-heading" ] [ text "Suzuki Taro Date:2016/09/01" ]
                        , div [] [ text "この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。" ]
                        ]
                    ]
                , hr [] []
                , div
                    [ class "media" ]
                    [ div [ class "media-body" ]
                        [ h4 [ class "media-heading" ] [ text "Tanaka Jiro Date:2016/09/01" ]
                        , div [] [ text "この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。" ]
                        ]
                    , div
                        [ class "media-right" ]
                        [ a [ href "#", class "icon-rounded" ] [ text "T" ]
                        ]
                    ]
                ]
            ]
        , section []
            [ chatForm
            ]
        ]


chatForm : Html Msg
chatForm =
    form [ class "chart-form pure-form" ]
        [ div [ class "input-group" ]
            [ input [ type_ "text", class "", placeholder "Comment" ] []
            , button [ class "pure-button button-secondary" ] [ text "SNED" ]
            ]
        ]



-- ---------------------------
-- MAIN
-- ---------------------------


main : Program () Model Msg
main =
    Browser.document
        { init = init
        , update = update
        , view =
            \m ->
                { title = "Elm Firebase Chat"
                , body = [ view m ]
                }
        , subscriptions = \_ -> Sub.none
        }
