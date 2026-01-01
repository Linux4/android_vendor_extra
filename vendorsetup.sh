if [ -z "$TARGET_UNOFFICIAL_BUILD_ID" ] && [ -z "$TARGET_RO_FILE_SYSTEM_TYPE" ]; then
    echo "Reserving space on /vendor for debugging builds"
    export TARGET_RO_FILE_SYSTEM_TYPE=ext4
    export BOARD_VENDORIMAGE_PARTITION_RESERVED_SIZE=104857600
    export BOARD_VENDORIMAGE_EXTFS_INODE_COUNT=-1
fi

for FILE in $(grep -iRl Xmx4096M $(gettop)/build/soong); do
	echo "Patching maximum java heap size in $FILE..."
	sed -i 's/Xmx4096M/Xmx2048M/g' "$FILE"
done

for BUILD in make soong; do
	for FILE in $(grep -iRl vendor/lineage-priv $(gettop)/build/"$BUILD"); do
		echo "Patching release-keys path in $FILE..."
		sed -i 's|vendor/lineage-priv|vendor/linux4/security|g' "$FILE"
	done
done
