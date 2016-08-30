--------------------------------------------------------------------------------
{-# LANGUAGE OverloadedStrings #-}
import           Data.Monoid            (mappend,(<>),mconcat)
import           Hakyll
import           Control.Monad          (forM,forM_)
import           Data.List              (sortBy,isInfixOf,isSuffixOf)
import           Data.Ord               (comparing)
import           System.Locale          (defaultTimeLocale)
import           System.FilePath.Posix  (takeBaseName,takeDirectory,(</>),splitFileName)
import           Text.Pandoc.Options

--------------------------------------------------------------------------------
main :: IO ()
main = do
  revealTemplate <- readFile "templates/revealjs.html"

  hakyll $ do
    match "images/*" $ do
      route   idRoute
      compile copyFileCompiler

    match "images/**/*" $ do
      route   idRoute
      compile copyFileCompiler

    match "css/*" $ do
      route   idRoute
      compile compressCssCompiler

    match "js/*" $ do
      route   idRoute
      compile copyFileCompiler

    match "reveal.js/*" $ do
      route idRoute
      compile copyFileCompiler

    match "reveal.js/**/*" $ do
      route idRoute
      compile copyFileCompiler

    match "pages/*" $ do
      route   $ cleanRouteWithoutDir
      compile $ pandocCompiler
        >>= loadAndApplyTemplate "templates/page.html"    defaultContext
        >>= loadAndApplyTemplate "templates/default.html" defaultContext
        >>= relativizeUrls
        >>= cleanIndexUrls

    match "posts/*" $ do
      route $ cleanRoute
      compile $ pandocCompiler
        >>= loadAndApplyTemplate "templates/post.html"    postCtx
        >>= loadAndApplyTemplate "templates/default.html" postCtx
        >>= relativizeUrls
        >>= cleanIndexUrls

    match "presentations/*" $ do
      route $ cleanRoute
      compile $ presentationCompiler revealTemplate
        >>= loadAndApplyTemplate "templates/revealjs.html" defaultContext
        >>= relativizeUrls
        >>= cleanIndexUrls

    create ["archive.html"] $ do
      route $ cleanRoute
      compile $ do
        posts <- recentFirst =<< loadAll "posts/*"
        let archiveCtx =
                listField "posts" postCtx (return posts) `mappend`
                constField "title" "Archives"            `mappend`
                defaultContext

        makeItem ""
          >>= loadAndApplyTemplate "templates/archive.html" archiveCtx
          >>= loadAndApplyTemplate "templates/default.html" archiveCtx
          >>= relativizeUrls
          >>= cleanIndexUrls


    match "index.html" $ do
      route idRoute
      compile $ do
        getResourceBody
          >>= applyAsTemplate defaultContext
          >>= loadAndApplyTemplate "templates/default.html" defaultContext
          >>= relativizeUrls
          >>= cleanIndexUrls

    match "templates/*" $ compile templateCompiler

--------------------------------------------------------------------------------
postCtx :: Context String
postCtx =
    dateField "date" "%B %e, %Y" `mappend`
    defaultContext

cleanRoute :: Routes
cleanRoute = customRoute createIndexRoute
  where
    createIndexRoute ident = takeDirectory p </> takeBaseName p </> "index.html"
                            where p = toFilePath ident

cleanRouteWithoutDir :: Routes
cleanRouteWithoutDir = customRoute createIndexRoute
  where
    createIndexRoute ident = takeBaseName p </> "index.html"
                            where p = toFilePath ident

cleanIndexUrls :: Item String -> Compiler (Item String)
cleanIndexUrls = return . fmap (withUrls cleanIndex)

cleanIndex :: String -> String
cleanIndex url
    | idx `isSuffixOf` url = take (length url - length idx) url
    | otherwise            = url
  where idx = "index.html"

presentationCompiler :: String -> Compiler (Item String)
presentationCompiler revealTemplate = pandocCompilerWith defaultHakyllReaderOptions writerOptions
  where writerOptions = defaultHakyllWriterOptions { writerSlideVariant = RevealJsSlides
                                                   , writerSlideLevel = Just 2
                                                   , writerHtml5 = True
                                                   , writerTemplate = revealTemplate
                                                   }
