#!/usr/bin/env runhaskell
{-
 -      ``ShpToShx''
 -      (c) 2009 James Cook
 -}

module Main where

import System.Environment
import Database.Shapefile
import System.FilePath

main = do
    files <- getArgs
    sequence_
        [ do
            shp <- readShpFile shp
            writeShxFile shx (uncurry shxFromShp shp)
            
        | shp <- files
        , let shx = replaceExtension shp "shx"
        ]