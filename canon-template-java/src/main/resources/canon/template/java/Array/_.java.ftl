<#if ! model.baseSchema.isGenerateFacade?? || ! model.baseSchema.isGenerateFacade>
<#include "../canon-template-java-Prologue.ftl">
<@setPrologueJavaType model/>
import javax.annotation.concurrent.Immutable;

import org.symphonyoss.s2.canon.runtime.IEntity${modelJavaCardinality};
import org.symphonyoss.s2.common.dom.json.ImmutableJsonArray;
import org.symphonyoss.s2.common.exception.BadFormatException;

<@importFieldTypes model false/>
import ${javaFacadePackage}.*;

<#include "../../../template/java/Array/Array.ftl">
<#include "../../../proforma/java/Array/Facade.ftl">
<#include "../canon-template-java-Epilogue.ftl">
</#if>