module Main exposing (Comment, Msg(..), User, chatForm, mediaView, nameInitial)

import Browser
import Html exposing (..)
import Html.Attributes exposing (class, href, placeholder, type_)
import Html.Events exposing (onInput)



-- ---------------------------
-- MODEL
-- ---------------------------


type alias User =
    { uid : Int, name : String }


nameInitial : User -> String
nameInitial { name } =
    String.slice 0 1 name


type alias Comment =
    { user : User, content : String }


type alias Model =
    { content : String, comments : List Comment }


tanaka =
    User 1 "Tanaka Jiro"


suzuki =
    User 2 "Suzuki Taro"


init : () -> ( Model, Cmd Msg )
init _ =
    ( { content = ""
      , comments =
            [ Comment suzuki "Suzukiの1つ目のコメントです。"
            , Comment suzuki "Suzukiの2つ目のコメントです。"
            , Comment tanaka "Tanakaの1つ目のコメントです。"
            , Comment suzuki "Suzukiの3つ目のコメントです。"
            , Comment tanaka "Tanakaの2つ目のコメントです。"
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
mediaView { user, content } =
    div [ class "media" ]
        [ div [ class "media-left" ]
            [ a [ href "#", class "icon-rounded" ] [ text "S" ]
            ]
        , div [ class "media-body" ]
            [ h4 [ class "media-heading" ] [ text <| user.name ++ " Date:2018/12/29" ]
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
