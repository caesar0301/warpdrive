# Add QGIS python modules
export PATH="/Applications/QGIS.app/Contents/MacOS/bin:$PATH"
export PYTHONPATH=~/.qgis2/python/plugins:$PYTHONPATH
export PYTHONPATH="/Applications/QGIS.app/Contents/Resources/python:$PYTHONPATH"
export DYLD_LIBRARY_PATH=/Applications/QGIS.app/Contents/MacOS/lib:$DYLD_LIBRARY_PATH
export DYLD_FRAMEWORK_PATH=/Applications/QGIS.app/Contents/Frameworks

## for standalone python app, need to add the right prefix:
# QgsApplication.setPrefixPath("/Applications/QGIS.app/Contents/MacOS", True)
