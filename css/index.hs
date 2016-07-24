{-# LANGUAGE OverloadedStrings #-}

module Main where

import Prelude hiding (div, span)
import Clay
import Styles.Code

centerBlock = do
  display block
  sym2 margin (px 0) auto

textColor = color black

styleSheet :: Css
styleSheet = do
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
