if [ -z "$TARGET_UNOFFICIAL_BUILD_ID" ] && [ -z "$TARGET_RO_FILE_SYSTEM_TYPE" ]; then
    echo "Reserving space on /vendor for debugging builds"
    export TARGET_RO_FILE_SYSTEM_TYPE=ext4
    export BOARD_VENDORIMAGE_PARTITION_RESERVED_SIZE=104857600
    export BOARD_VENDORIMAGE_EXTFS_INODE_COUNT=-1
fi
