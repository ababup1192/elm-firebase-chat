module Main exposing (Comment, Msg(..), chatForm, mediaView)

import Browser
import Html exposing (..)
import Html.Attributes exposing (class, href, placeholder, type_)
import Html.Events exposing (onInput)



-- ---------------------------
-- MODEL
-- ---------------------------


type alias Comment =
    { name : String, content : String }


type alias Model =
    { content : String, comments : List Comment }


init : () -> ( Model, Cmd Msg )
init _ =
    ( { content = ""
      , comments =
            [ Comment "Suzuki Taro" "1つ目のコメントです。"
            , Comment "Suzuki Taro" "2つ目のコメントです。"
            , Comment "Suzuki Taro" "3つ目のコメントです。"
            ]
      }
    , Cmd.none
    )



-- ---------------------------
-- UPDATE
-- ---------------------------


type Msg
    = UpdateContent String


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UpdateContent c ->
            ( { model | content = c }, Cmd.none )



-- ---------------------------
-- VIEW
-- ---------------------------


view : Model -> Html Msg
view { content, comments } =
    div [ class "page" ]
        [ section [ class "card" ]
            [ div [ class "card-header" ]
                [ text "Elm Chat"
                ]
            , div [ class "card-body" ] <|
                List.map mediaView comments
                    ++ [ hr [] []
                       , div
                            [ class "media" ]
                            [ div [ class "media-body" ]
                                [ h4 [ class "media-heading" ] [ text "Tanaka Jiro Date:2016/09/01" ]
                                , div [] [ text content ]
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


mediaView : Comment -> Html Msg
mediaView { name, content } =
    div [ class "media" ]
        [ div [ class "media-left" ]
            [ a [ href "#", class "icon-rounded" ] [ text "S" ]
            ]
        , div [ class "media-body" ]
            [ h4 [ class "media-heading" ] [ text <| name ++ " Date:2018/12/29" ]
            , div [] [ text content ]
            ]
        ]


chatForm : Html Msg
chatForm =
    form [ class "chart-form pure-form" ]
        [ div [ class "input-group" ]
            [ input [ type_ "text", class "", placeholder "Comment", onInput UpdateContent ] []
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
