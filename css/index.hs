{-# LANGUAGE OverloadedStrings #-}

module Main where

import Prelude hiding (div, span)
import Clay
import Styles.Code

centerBlock = do
  display block
  sym2 margin (px 0) auto

  -- margin 0 auto
  -- margin l u r d
  -- sym2 margin l u
  -- sym4 margin l

textColor = color black

myHeader = do
  ".header" ?
    do borderBottom solid (px 2) black
       marginBottom (vh 5)
       textAlign center
  ".header__navigation-link" ?
    do textColor
       textDecoration none
       textTransform uppercase
       marginBottom (px 0)
       sym padding (px 5)


styleSheet :: Css
styleSheet = do
  myHeader
  ".title-card" ?
    do textAlign center
       marginTop (vh 20)
  ".post-list__list" ?
    listStyleType none
  ".contact-icons" ?
    do centerBlock
       paddingTop (vh 5)
       textAlign center
  ".contact-icon" ?
    do display inlineBlock
       sym padding (em 0.25)
  ".content" ?
    do centerBlock
       width (pct 95)
  a ?
    textColor
  body ?
    do centerBlock
       textColor
       background $ rgb 223 223 223
       maxWidth (px 700)
       fontSize (em 1.5)

main :: IO ()
main = putCss styleSheet
