// Copyright Epic Games, Inc. All Rights Reserved.

using UnrealBuildTool;

public class SekiroCombat : ModuleRules
{
	public SekiroCombat(ReadOnlyTargetRules Target) : base(Target)
	{
		PCHUsage = PCHUsageMode.UseExplicitOrSharedPCHs;

		PublicDependencyModuleNames.AddRange(new string[] { "Core", "CoreUObject", "Engine", "InputCore", "EnhancedInput" });
	}
}
