<#include "../canon-template-java-Prologue.ftl">
<@setPrologueJavaType model/>
import javax.annotation.Nonnull;
import javax.annotation.Nullable;

import org.symphonyoss.s2.canon.runtime.exception.CanonException;
import org.symphonyoss.s2.canon.runtime.IEntityHandler;

<@importFieldTypes model true/>

<#include "Path.ftl">
public interface I${modelJavaClassName}PathHandler extends I${model.model.camelCapitalizedName}EntityHandler
{
<#list model.operations as operation>
  <@printMethodJavadoc operation false/>
  ${methodResponseDecl} handle${operation.camelCapitalizedName}(
  <#if operation.payload??>
  <@setJavaType operation.payload.schema/>
  <#if operation.payload.isRequired>
    @Nonnull  ${fieldType?right_pad(25)} _payload<#if operation.parameters?size != 0>,</#if>
  <#else>
    @Nullable ${fieldType?right_pad(25)} _payload<#if operation.parameters?size != 0>,</#if>
  </#if>
  </#if>
	<#list operation.parameters as parameter>
	  <@setJavaType parameter.schema/>
	  <#if parameter.isRequired>
    @Nonnull  ${fieldType?right_pad(25)} ${parameter.camelName}<#sep>,
    <#else>
    @Nullable ${fieldType?right_pad(25)} ${parameter.camelName}<#sep>,
    </#if>
	</#list>
	
    ) throws CanonException;
    
</#list>
}
<#include "../canon-template-java-Epilogue.ftl">