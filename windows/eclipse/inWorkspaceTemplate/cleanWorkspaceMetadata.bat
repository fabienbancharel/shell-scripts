@ECHO ON
echo NETTOYAGE FICHIERS METADATA DU WORKSPACE ECLIPSE (index, historique, index Nexus)

CALL :CleanMetadata
GOTO :end

:CleanMetadata
echo NETTOYAGE FICHIERS INDEX ECLIPSE
del /S /Q .metadata\.plugins\org.eclipse.core.resources\.history\*

echo NETTOYAGE FICHIERS HISTORISES ECLIPSE
del /S /Q .metadata\.plugins\org.eclipse.jdt.core\*.index

echo NETTOYAGE FICHIERS INDEX NEXUS
del /S /Q .metadata\.plugins\org.eclipse.m2e.core\nexus\*

echo FIN NETTOYAGE METADATA
GOTO :EOF

:end
ECHO.
ECHO Done.